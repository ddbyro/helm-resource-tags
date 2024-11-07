{{- define "resourceAnnotations.annotations" -}}
{{- $requiredKeys := list "name" "environment" "owner" "project" "costCenter" "application" -}}
{{- range $key := $requiredKeys -}}
{{- required (printf "Annotation %s is required" $key) (index .Values.annotations $key) -}}
{{- end }}
annotations:
  {{- range $key, $value := .Values.annotations }}
  {{ $key }}: {{ $value | quote }}
  {{- end }}
{{- end -}}
