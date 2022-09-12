class PipeType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'C' },
    { id: 3, name: 'V' },
    { id: 4, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :details

end