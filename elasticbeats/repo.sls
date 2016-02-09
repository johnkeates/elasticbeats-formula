# elasticbeats.repo
{%- if grains['os_family'] == 'Debian' %}

beats-repo-key:
  cmd.run:
    - name: wget -O - https://packages.elasticsearch.org/GPG-KEY-elasticsearch| apt-key add -
    - unless: apt-key list | grep 'Elasticsearch (Elasticsearch Signing Key)'

beats-repo:
  pkgrepo.managed:
    - humanname: Elastic Beats Debian Repository
    - name: deb https://packages.elastic.co/beats/apt stable main
    - require:
      - cmd: beats-repo-key
{%- endif %}
