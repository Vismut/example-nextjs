{{- define "tolerations" }}
tolerations:
  - key: node-role.kubernetes.io
    operator: "Equal"
    value: {{ pluck .Values.global.env .Values.app.nodes | first | default .Values.app.nodes._default }}
    effect: "NoExecute"
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
      - matchExpressions:
        - key: node-role.kubernetes.io/{{ pluck .Values.global.env .Values.app.nodes | first | default .Values.app.nodes._default }}
          operator: In
          values:
          - ""
      - matchExpressions:
        - key: node-role/{{ pluck .Values.global.env .Values.app.nodes | first | default .Values.app.nodes._default }}
          operator: In
          values:
          - ""
  podAntiAffinity:
    preferredDuringSchedulingIgnoredDuringExecution:
    - podAffinityTerm:
        labelSelector:
          matchLabels:
            app: {{ .Chart.Name }}
        topologyKey: kubernetes.io/hostname
      weight: 100
{{- end }}
