#
# Ronin Scanners - A Ruby library for Ronin that provides Ruby interfaces to
# various third-party security scanners.
#
# Copyright (c) 2008-2012 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

require 'ronin/database/migrations'

module Ronin
  module Database
    module Migrations
      migration(
        :create_scanners_table,
        :needs => [:create_licenses_table, :create_script_paths_table]
      ) do
        up do
          create_table :ronin_scanners_scanners do
            column :id, Integer, :serial => true
            column :type, String, :not_null => true
            column :name, String, :not_null => true
            column :version, String, :default => '0.1'
            column :description, Text
            column :license_id, Integer
            column :script_path_id, Integer
          end

          create_index :ronin_scanners_scanners, :name
        end

        down do
          drop_table :ronin_scanners_scanners
        end
      end
    end
  end
end
