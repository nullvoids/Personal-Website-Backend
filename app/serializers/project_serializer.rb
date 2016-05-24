class ProjectSerializer < BaseSerializer
  attributes :id, :title, :description, :external_url, :repo_url, :image_url, :order, :hidden
end
