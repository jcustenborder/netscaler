module Netscaler
  class Lb
    class Vserver
      class Bind < NetscalerService
        def initialize(netscaler)
          @netscaler=netscaler
        end

        def service(payload)
          raise ArgumentError, 'payload cannot be null' if payload.nil?
          validate_payload(payload, [:name, :serviceName])
          return @netscaler.adapter.post_no_body("config/lbvserver_service_binding/#{payload['name']}?action=bind/", {'params' => {'action' => 'bind'}, 'lbvserver_service_binding' => payload})
        end

      end
    end
  end
end



