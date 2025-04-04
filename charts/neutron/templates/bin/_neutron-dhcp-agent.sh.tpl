#!/bin/bash

{{/*
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/}}

set -x
exec neutron-dhcp-agent \
  --config-file /etc/neutron/neutron.conf \
{{- if ( has "ovn" .Values.network.backend ) }}
  --config-file /tmp/pod-shared/ovn.ini \
{{- end }}
{{- if and ( empty .Values.conf.neutron.DEFAULT.host ) ( .Values.pod.use_fqdn.neutron_agent ) }}
  --config-file /tmp/pod-shared/neutron-agent.ini \
{{- end }}
{{- if ( has "openvswitch" .Values.network.backend ) }}
  --config-file /etc/neutron/plugins/ml2/openvswitch_agent.ini \
{{- end }}
  --config-file /etc/neutron/dhcp_agent.ini
