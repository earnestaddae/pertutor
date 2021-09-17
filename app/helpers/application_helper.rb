module ApplicationHelper

  # set the page title and make it dynamic
  def full_title(page_title = " ")
    default_title = "PerTutor - Discuss | Teach | Earn"
    if page_title.empty?
      default_title
    else
      "#{page_title} | #{default_title} "
    end
  end

  # for current_account owner
  def owners_only(&block)
    block.call if current_account.owner == current_user
    # block.call if current_user.try(:admin?)
  end

  # checks whether or the lecture is over
  def lecture_status(lecture)
    if !lecture.nil? && lecture.end_date <= Date.today
      content_tag(:h6, "Ended", class: "badge badge-danger p-2")
    else
      content_tag(:h6, "Upcoming", class: "badge badge-success p-2")
    end
  end

  # booking status
  def booking_status(booking)
    if booking.schedule.available_date <= Date.today
      content_tag(:span, "Ended", class: "badge badge-danger p-2")
    else
      content_tag(:span, "Upcoming", class: "badge badge-success p-2")
    end
  end

  # formats time
  def time_format(lecture_date)
    lecture_date.strftime("%A, %d %b %Y @ %l:%M %p")
  end

  # generates token to invite user
  def generate_tk
    SecureRandom.hex(16)
  end

  # makes navs active
  def active?(path)
    "active" if current_page? path
  end

  # displays whether the available medium to teach is online or in person
  def schedule_medium(schedule)
    schedule.online? ? "Online" : "In Person"
  end
end
