{{/*
Expand the name of the chart.
*/}}
{{- define "scheduler-plugins-as-a-second-scheduler.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "scheduler-plugins-as-a-second-scheduler.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "scheduler-plugins-as-a-second-scheduler.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "scheduler-plugins-as-a-second-scheduler.labels" -}}
helm.sh/chart: {{ include "scheduler-plugins-as-a-second-scheduler.chart" . }}
{{ include "scheduler-plugins-as-a-second-scheduler.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "scheduler-plugins-as-a-second-scheduler.selectorLabels" -}}
app.kubernetes.io/name: {{ include "scheduler-plugins-as-a-second-scheduler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Namespace
*/}}
{{- define "scheduler-plugins.namespace" -}}
{{- default .Release.Namespace .Values.namespaceOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Names
*/}}
{{- define "scheduler-plugins.schedulerFullName" -}}
{{- .Values.name }}-scheduler
{{- end }}

{{- define "scheduler-plugins.schedulerName" -}}
{{- include "scheduler-plugins.schedulerFullName" . | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "scheduler-plugins.controllerFullName" -}}
{{- .Values.name }}-controller
{{- end }}

{{- define "scheduler-plugins.controllerName" -}}
{{- include "scheduler-plugins.controllerFullName" . | trunc 63 | trimSuffix "-" }}
{{- end }}
