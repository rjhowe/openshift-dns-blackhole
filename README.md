# openshift-dns-blackhole


- Create a DNS Blackhole for bogus queries coming from OpenShift pods for search domains being appended due the ndots settings.

1. Pull Repo
2. Create dnsmasq container
3. Create the deployments and services

    ```bash
    # oc create -f ./deployment-services 
    ```

4. Modify the dns.operorator

    ```yaml
    # oc edit dns.operator 
    
    # ADD under spec  
      servers:
      - name: cluster.local.ndots
        zones:
        - yahoo.com
        - redhat.com
        forwardPlugin:
          policy: Random 
          upstreams: 
          - <DNSMASQ_SERVICE_IP>
    ```
