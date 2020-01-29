# HERE IN CASE WE WANT TO VERSION THE API

# class Api::V1::PostsController < ApplicationController
#   require 'open-uri'
#   require 'json'

#   def index
#     tag = params[:tag]
#     sortBy = params[:sortBy]
#     direction = params[:direction]

#     if tag.empty?
#       render json: { "error": "Tags parameter is required" }
#     else
#       url = "https://hatchways.io/api/assessment/blog/posts?tag=#{tag}&sortBy=#{sortBy}&direction=#{direction}"
#       response = open(url).read
#       data = JSON.parse(response)

#       all_attribute_names = data["posts"][0].keys

#         if !direction.nil? && direction == "desc"
#           data = data["posts"].sort_by { |attribute| attribute["#{sortBy}"] }.reverse
#         elsif (!direction.nil? && direction == "asc") || direction.nil?
#           data = data["posts"].sort_by { |attribute| attribute["#{sortBy}"]}
#         end

#         if !all_attribute_names.include?(sortBy) && !sortBy.nil?
#           render json: { "error": "sortBy parameter is invalid" }
#         else
#         render json: {success: true, data: data}, status: 200
#         end
#     end
#   end

#   private

# end

