# encoding: utf-8

require 'backports'
require_relative '../test_helper'

module Infopark; module Crm

  class ActivityDeleteTest < ConnectorTestCase

    class << self
      def startup
        CrmSetup.custom_types
        @@activity_id = Activity.create({
            :kind => 'note',
            :title => 'title',
            }).id
      end
    end

    def test_delete_by_id_should_be_successful
      assert_nil Activity.find(@@activity_id).deleted_at
      result = Activity.delete(@@activity_id)
      assert_kind_of Net::HTTPOK, result
      assert_not_nil Activity.find(@@activity_id).deleted_at
    end

  end

end; end
