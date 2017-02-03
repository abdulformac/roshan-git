#
# Cookbook:: gitlab test
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

platform = node['platform_family']
raise "Error: bad platform #[platform]. please run this cookbook on RHEL/centos" if node['platform'] != 'centos'

node['gitlab-setup'] ['prereq_packages'].each do |pkg|
     package pkg
end

node ['gitlab-setup'] ['enable_start_services'].each do |srv|
      service srv do
	    action [:enable, :start]
		end
end

node['gitlab-setup'] ['firewall rules'].each do |port|
    firewalld_port "#[port]/tcp" do
	    action   :add
		zone 'public'
	end
end
		