module Ponto
  class Payment < Ponto::BaseResource
    def self.create(account_id:, access_token: nil, **attributes)
      path = Ponto.api_schema["account"]["payments"]
        .gsub("{accountId}", account_id)
        .gsub("{paymentId}", "")
      uri = Ponto.client.build_uri(path)
      create_by_uri(
        uri: uri,
        resource_type: "payment",
        attributes: attributes,
        access_token: access_token
      )
    end

    def self.find(id:, account_id:, access_token:)
      uri = Ponto.api_schema["account"]["payments"]
        .gsub("{accountId}", account_id)
        .sub("{paymentId}", id)
      find_by_uri(uri: uri, access_token: access_token)
    end

    def self.delete(id:, account_id:, access_token:)
      uri = Ponto.api_schema["account"]["payments"]
        .gsub("{accountId}", account_id)
        .sub("{paymentId}", id)
      destroy_by_uri(uri: uri, access_token: access_token)
    end
  end
end
