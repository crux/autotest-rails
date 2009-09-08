#!/usr/local/bin/ruby -w

require 'rubygems'
require 'minitest/autorun'

$:.unshift File.join((File.dirname __FILE__), %w{.. lib})
require 'autotest/rails'

class TestAutotestRails < MiniTest::Unit::TestCase
  def setup
    @a = Autotest::Rails.new
  end

  def test_class
    assert ! nil, @a
  end

  def test_path_to_classname
    %w{unit functional integration views controllers helpers}.each do |pkg|
      assert_equal "FooTest", (@a.path_to_classname "test/#{pkg}/foo_test.rb")
    end
  end

  def test_path_to_classname_from_submodule
    assert_equal "FooTest", (@a.path_to_classname 'test/unit/foo_test.rb')
    assert_equal "Foo::BarTest", (@a.path_to_classname 'test/unit/foo/bar_test.rb')
  end
end
