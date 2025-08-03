{{/*
Expand the name of the chart.
*/}}
{{- define "bookstore-api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "bookstore-api.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "bookstore-api.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
