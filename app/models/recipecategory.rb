class Recipecategory < ActiveHash::Base
  self.data = [
    {id: 1, name: 'お菓子'}, {id: 2, name: 'パン'}, {id: 3, name: '料理'},
  ]
end