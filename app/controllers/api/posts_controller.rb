class Api::PostsController < ApplicationController
  require 'open-uri'
  require 'json'

  def index
    tag = params[:tag]
    sortBy = params[:sortBy]
    direction = params[:direction]

    if tag.empty?
      return render json: { "error": "Tags parameter is required" }
    end

    url = "https://hatchways.io/api/assessment/blog/posts?tag=#{tag}&sortBy=#{sortBy}&direction=#{direction}"
    response = open(url).read
    data = JSON.parse(response)

    if data["posts"].empty?
      render json: { "error": "Tags parameter is invalid" }
    # elsif (direction != "asc" || direction != "desc") || !direction.nil?
    #   render json: { "error": "Direction parameter is invalid" }
    else

      all_attribute_names = data["posts"][0].keys

        # Sort based on direction parameter
        if !direction.nil? && direction == "desc"
          data = data["posts"].sort_by { |attribute| attribute["#{sortBy}"] }.reverse
        elsif (!direction.nil? && direction == "asc") || direction.nil?
          data = data["posts"].sort_by { |attribute| attribute["#{sortBy}"]}
        elsif !direction.nil? && (direction != "asc" || direction != "desc")
          return render json: { "error": "Direction parameter is invalid" }
        end

        # Check validity of sortBy parameter
        if !all_attribute_names.include?(sortBy) && !sortBy.nil?
          render json: { "error": "sortBy parameter is invalid" }
        else
        render json: {success: true, data: data}, status: 200
        end
    end
  end

  def all
    tag = params[:tag]
    sortBy = params[:sortBy]
    direction = params[:direction]
    url = "https://hatchways.io/api/assessment/blog/posts?tag=tech"
    response = open(url).read
    data = JSON.parse(response)
    render json: {success: true, data: data}, status: 200
  end
end
