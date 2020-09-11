class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :items
        has_many :comments
        has_many :orders
        



        #  パスワードが必須であること
        #  パスワードは6文字以上であること
        #  パスワードは半角英数字混合であること
        #  パスワードは確認用を含めて2回入力すること
         VALID_PASSWORD_REGEX =/\A[a-zA-Z0-9]+\z/
         validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }

        #  ニックネームが必須であること
         validates :nickname, presence: true

        #  ユーザー本名が、名字と名前がそれぞれ必須であること
        #  ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
         validates :first_name,presence:true,format:{with:/\A[ぁ-んァ-ン一-龥]/}
         validates :last_name,presence:true,format: {with:/\A[ぁ-んァ-ン一-龥]/}

        #  ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
        #  ユーザー本名のフリガナは全角（カタカナ）で入力させること
         validates :first_name_kana,presence:true,format:{with:/\A[ァ-ヶー－]+\z/}
         validates :last_name_kana,presence:true,format:{with:/\A[ァ-ヶー－]+\z/}

        #  生年月日が必須であること
         validates :birth,presence:true


        #  メールアドレスが必須であること
        #  メールアドレスが一意性であること
        # @が含まれていること
         validates :email,presence:true,uniqueness: true,format:{with: /\A\S+@\S+\.\S+\z/}
  
end










