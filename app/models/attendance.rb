class Attendance < ApplicationRecord

  after_create :attendance_send

  def attendance_send
    AttendanceMailer.attendance_email(self).deliver_now
  end

  belongs_to :user
  belongs_to :event
end
