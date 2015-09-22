#
# Cookbook Name:: remote-dir-repro
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

dirs = %w(/tmp/test/local/)

dirs.each do |dir|
  directory dir do
    action :create
    recursive true
  end
end

user 'muffin' do
  action :create
end

user 'cookie' do
  action :create
end

remote_directory '/tmp/test/local/something' do
  source 'something'
  files_owner 'muffin'
  files_group 'muffin'
  files_mode 0700
  owner 'cookie'
  group 'cookie'
  mode 0750
end

require 'pry' ; binding.pry
