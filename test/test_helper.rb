$:.unshift(File.dirname(__FILE__) + '/../lib')
 
require 'test/unit'
# rails environment - load my plugin baby!
require File.expand_path(File.join(File.dirname(__FILE__), '../../../../config/environment.rb'))
require 'rubygems'