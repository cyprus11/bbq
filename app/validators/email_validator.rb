class EmailValidator < ActiveModel::Validator
  def validate(record)
    if User.exists?(email: record.user_email)
      record.errors.add :base, 'Указан некорректный адрес почты'
    end
  end
end
