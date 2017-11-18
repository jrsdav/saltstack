{% set pillar = salt['pillar.get']('cron') %}
  
{% for name, job in pillar.job.iteritems() %}
job_{{ name }}:
  {%- if job.enabled|default(True) %}
  cron.present:
    - name:  >
        {{ job.command }}
    {%- if job.get('identifier', True) %} 
    - identifier: {{ job.get('identifier', job.get('name', name)) }}
    {%- endif %}
    - user: {{ job.user|default("root") }} 
    {%- if job.minute is defined %}
    - minute: '{{ job.minute }}'
    {%- endif %}
    {%- if job.hour is defined %}
    - hour: '{{ job.hour }}'
    {%- endif %}
    {%- if job.daymonth is defined %}
    - daymonth: '{{ job.daymonth }}'
    {%- endif %}
    {%- if job.dayweek is defined %}
    - dayweek: '{{ job.dayweek }}'    
    {%- endif %}
  {%- else %}
  cron.absent:
    - name: {{ job.command }}
    {%- if job.get('identifier', True) %}
    - identifier: {{ job.get('identifier', job.get('name', name)) }}
    {%- endif %}
  {%- endif %}
{%- endfor %}
