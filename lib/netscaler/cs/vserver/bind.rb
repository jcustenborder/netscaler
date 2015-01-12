module Netscaler
  class Cs
    class Vserver
      class Bind < NetscalerService
        def initialize(netscaler)
          @netscaler=netscaler
        end

=begin

        object=
            {
                'params': {'action':'bind'},
            "csvserver_cspolicy_binding":
            {
                "name":"cs_test_80",
            "targetvserver":"lb_thumby_80",
            "policyname": "cs_test_rule",
            "priority": "800",

        }
        }

=end
        def cspolicy(payload)
          raise ArgumentError, 'payload cannot be null' if payload.nil?
          validate_payload(payload, [:name, :targetvserver])
          # Need to find a way to throw optional args as well, including :policyname and :priority
          return @netscaler.adapter.post_no_body("config/csvserver_cspolicy_binding/#{payload['name']}", {'params' => {'action' => 'bind'}, 'csvserver_cspolicy_binding' => payload})
        end

        def rewritepolicy(payload)
          raise ArgumentError, 'payload cannot be null' if payload.nil?
          validate_payload(payload, [:name, :policyName, :priority, :bindpoint])
          return @netscaler.adapter.post_no_body("config/csvserver_rewritepolicy_binding/#{payload['name']}", {'params' => {'action' => 'bind'}, 'csvserver_rewritepolicy_binding' => payload})
        end

        def responderpolicy(payload)
          raise ArgumentError, 'payload cannot be null' if payload.nil?
          validate_payload(payload, [:name, :policyName, :priority])
          return @netscaler.adapter.post_no_body("config/csvserver_responderpolicy_binding/#{payload['name']}", {'params' => {'action' => 'bind'}, 'csvserver_responderpolicy_binding' => payload})
        end

      end
    end
  end
end


