resource "helm_release" "ingress-nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart     = "ingress-nginx"
  namespace = "default"

  set {
    name  = "controller.replicaCount"
    value = 2
  }

  set {
    name  = "service.beta.kubernetes.io/azure-load-balancer-health-probe-request-path"
    value = "/healthz"
  }

  set {
    name = "controller.service.externalTrafficPolicy"
    value = "Local"
  }

  set {
    name = "controller.allowSnippetAnnotations"
    value = true
  }

  # Add more set blocks for other values
}
