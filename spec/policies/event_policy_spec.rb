require 'rails_helper'
require 'pry'

RSpec.describe EventPolicy do
  let(:user) { User.new }
  let(:event) { Event.new(user: user) }
  let(:other_user) { User.new }

  subject { EventPolicy }

  context 'create event' do
    permissions :create? do
      it { is_expected.to permit(user, Event) }
      it { is_expected.not_to permit(nil, Event) }
    end
  end

  context "edit update destroy event" do
    before do
      user.events << event
    end

    permissions :edit? do
      it { is_expected.to permit(user, event) }
      it { is_expected.not_to permit(nil, event) }
      it { is_expected.not_to permit(other_user, event) }
    end

    permissions :update? do
      it { is_expected.to permit(user, event) }
      it { is_expected.not_to permit(nil, event) }
      it { is_expected.not_to permit(other_user, event) }
    end

    permissions :destroy? do
      it { is_expected.to permit(user, event) }
      it { is_expected.not_to permit(nil, event) }
      it { is_expected.not_to permit(other_user, event) }
    end
  end

end
