#
# Author:: Chef Partner Engineering (<partnereng@chef.io>)
# Copyright:: Copyright (c) 2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'ffi_yajl'

module Vra
  class CatalogItemEntitled
    attr_reader :id, :client
    def initialize(client, opts)
      @client = client
      @data   = opts[:data]
      @catalog_item_data = @data['catalogItem']
      @id                = @catalog_item_data['id']
    end

    def name
      @catalog_item_data['name']
    end

    def description
      @catalog_item_data['description']
    end

    def status
      @catalog_item_data['status']
    end

    def entitled_organizations
      @data['entitledOrganizations']
    end

    def organization
      return {} if @catalog_item_data['organization'].nil?

      @catalog_item_data['organization']
    end

    def tenant_id
      organization['tenantRef']
    end

    def tenant_name
      organization['tenantLabel']
    end

    def subtenant_id
      organization['subtenantRef']
    end

    def subtenant_name
      organization['subtenantLabel']
    end

    def blueprint_id
      @catalog_item_data['providerBinding']['bindingId']
    end
  end
end
