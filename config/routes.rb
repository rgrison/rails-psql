SampleRails326Postgres::Application.routes.draw do
  
  root :to => 'hill#read'


  get 'read', :to => 'hill#read'
  get 'write', :to => 'hill#visit'


  # Test stage
end
