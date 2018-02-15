#
# Cookbook:: edrms
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe "java"
include_recipe "edrms::apache2"
include_recipe "edrms::mysql"
include_recipe "edrms::tomcat"
include_recipe "edrms::alfresco"
