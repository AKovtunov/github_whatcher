require "./github_events"
describe "events" do
	let(:name){"AKovtunov"}
	let(:date){"08"}
	it "should have access to data" do
		expect(get_data("/users/#{name}/events")).not_to be_nil
		expect(get_data("/users/#{name}/events")).to be_kind_of(Array)
	end
	it "should get events by its date" do
		expect(get_events_by_date(name,date)).not_to be_nil
		expect(get_events_by_date(name,date)).to be_kind_of(Hash)
	end
	xit "should not fail" do
		expect(get_events_by_date("ASDASDASD",94)).not_to be_nil
		expect(get_data(123)).not_to be_nil
	end
end