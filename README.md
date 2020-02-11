# OpenShift/Kubernetes Logging With New Relic & Fluent-bit Daemonset
Simple proof-of-concept for aggregating Openshift containerd/docker output with 
[fluent-bit](https://fluentbit.io/) and sending them to [New Relic One](https://newrelic.com/platform).

1. Build and deploy the docker container somewhere

2. Create a secret with newrelic creds:

```yaml
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: newrelic-creds
data:
  newrelic-key: <NEW RELIC KEY HERE>
```

3. (OpenShift Only) Create a priv user

```
$ oc adm policy add-scc-to-user privileged -z fluent-bit
```

4. Deploy daemonset & other RBAC schnazz

```
$ kubectl create -f <whatever your yaml>
```
