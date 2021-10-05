class CreateSurveyQuestionCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :survey_question_categories do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
