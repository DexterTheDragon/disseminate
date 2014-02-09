require 'test_helper'

class GroupPolicyTest < PolicyTest
  test 'can create new' do
    user = User.new
    assert permit(user, Group.new, :new)
    assert permit(user, Group.new, :create)
  end

  test 'can edit own' do
    user = User.new
    group = Group.new
    group.user = user

    assert permit(user, group, :edit)
  end

  test 'cannot edit others' do
    user = User.new
    group = Group.new

    assert forbid(user, group, :edit)
  end
end
