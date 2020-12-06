require 'test_helper'

class FightersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fighter = fighters(:one)
  end

  test "should get index" do
    get fighters_url, as: :json
    assert_response :success
  end

  test "should create fighter" do
    assert_difference('Fighter.count') do
      post fighters_url, params: { fighter: { about: @fighter.about, losses: @fighter.losses, name: @fighter.name, photo: @fighter.photo, titles: @fighter.titles, user_id: @fighter.user_id, weightclass: @fighter.weightclass, wins: @fighter.wins } }, as: :json
    end

    assert_response 201
  end

  test "should show fighter" do
    get fighter_url(@fighter), as: :json
    assert_response :success
  end

  test "should update fighter" do
    patch fighter_url(@fighter), params: { fighter: { about: @fighter.about, losses: @fighter.losses, name: @fighter.name, photo: @fighter.photo, titles: @fighter.titles, user_id: @fighter.user_id, weightclass: @fighter.weightclass, wins: @fighter.wins } }, as: :json
    assert_response 200
  end

  test "should destroy fighter" do
    assert_difference('Fighter.count', -1) do
      delete fighter_url(@fighter), as: :json
    end

    assert_response 204
  end
end
