class Playcategory < ActiveHash::Base
  self.data = [
    {id: 1, name: '遊び'}, {id: 2, name: '工作'}, {id: 3, name: '学習'},
  ]
end