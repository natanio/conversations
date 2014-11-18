json.array!(@hangouts) do |hangout|
  json.extract! hangout, :id, :name, :language_id, :post_id, :private
  json.url hangout_url(hangout, format: :json)
end
