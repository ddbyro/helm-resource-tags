{{- define "resourceAnnotations.annotations" -}}

{{- $requiredKeys := list "name" "environment" "owner" "project" "costCenter" "application" -}}
{{- $actualKeys := .Values.annotations | keys -}}

{{- range $key := $requiredKeys -}}
  {{- if not (has $key $actualKeys) -}}
    {{- fail (printf "Annotation %s is required" $key) -}}
  {{- end -}}
{{- end }}

{{- range $key, $value := .Values.annotations }}
{{ $key }}: {{ $value | quote }}
{{- end }}

{{- end -}}