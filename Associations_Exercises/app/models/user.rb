# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  #students and their enrolled courses
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: 'Enrollment'
  
  has_many :enrolled_courses,
    through: :enrollments,
    source: :course
    
  #professor_courses
  has_many :courses,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: 'Course'
end
