json.extract! postulacion, :id, :user_id, :oferta_id, :estado, :resultado, :created_at, :updated_at
json.url postulacion_url(postulacion, format: :json)
