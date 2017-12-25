class User < ApplicationRecord
  has_many :drinkeds
  #引数に関連するユーザーが存在すればそれを返し、存在しまければ新規に作成する
  def self.find_or_create_from_auth_hash(auth_hash)
#OmniAuthで取得した各データを代入していく
    provider = auth_hash[:provider]
    ui_d = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]
    add_hash = Digest::SHA256.hexdigest(ui_d)

    User.find_or_create_by(provider: provider, u_id: ui_d) do |user|
      #providerとidが一致すれば作らない
      #providerとu_idをＤＢに追加しつうnicnameとimg_URLをついかする
      user.nickname = nickname
      user.image_url = image_url
      user.add_hash = add_hash
    end
  end
end
