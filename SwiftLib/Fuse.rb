//
//  Fuse.rb
//  DMSLib
//
//

require 'open-uri'
require 'uri'
require 'net/http'
require 'fileutils'
require 'xcodeproj'

class String
    def red;            "\e[31m#{self}\e[0m" end
    def green;          "\e[32m#{self}\e[0m" end
    def yellow;         "\e[33m#{self}\e[0m" end
end

project_files = Dir[ __dir__ + "/../../../*.xcodeproj" ]

if project_files.length > 0
    project_path = project_files[0]
    project_file_name = project_path.split('/').last
    project_folder_name = project_file_name.split('.').first

    info_plist_files = Dir[ "./" + project_folder_name + "/*.plist" ]

    if info_plist_files.length > 0
        puts "[inai-pod] Adding the required Queries Schemes in plist files"
        info_plist_files.each { |info_plist_file_path|
            puts "[inai-pod] Plist file path: " + info_plist_file_path

            info=Xcodeproj::Plist.read_from_path(info_plist_file_path)
            queriesSchemes = info["LSApplicationQueriesSchemes"] || []
            queriesSchemesToAdd = ["credpay", "phonepe", "paytmmp", "tez", "paytm", "bhim"]
            queriesSchemesToAdd.each { |item|
                if queriesSchemes.include?(item) == false
                    queriesSchemes.push(item)
                end
            }
            info["LSApplicationQueriesSchemes"] = queriesSchemes
    
            Xcodeproj::Plist.write_to_path(info, info_plist_file_path)
        }
        puts "[inai-pod] Done.".green
    else
        puts "[inai-pod] No plist file found. Please add the required URL Schemes & Queries Schemes manually.".yellow
        puts "[inai-pod] Done.".green
    end
end
