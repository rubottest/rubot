module Rubot
  module Fixtures

    def self.each(&block)
      raise "No loader available" unless @loader
      @loader.each(&block)
    end

    def self.loader=(loader)
      @loader = loader
    end

    class Fixture
      attr_reader :instructions, :expected
      def initialize(instructions, expected)
        @instructions, @expected = instructions, expected
      end
    end

    class Loader
      OUTPUT_REGEXP = /^Output: (.*)/
      def initialize(glob)
        @glob = glob
      end

      def fixtures
        @fixtures ||= get_fixtures
      end

      def each(&block)
        fixtures.each(&block)
      end

      include Enumerable

    private

      def name(path)
        File.basename(path).split('.').first
      end

      def get_fixtures
        fixtures = {}
        Dir.glob(@glob).each do |path|
          fixtures[name(path)] = read_fixture(path)
        end
        fixtures
      end

      def read_fixture(path)
        parse_fixture File.read(path)
      end

      def parse_fixture(code)
        expected_output = []
        instructions = []
        code.lines.each do |l|
          m = OUTPUT_REGEXP.match(l)
          if m
            expected_output << m[1]
          else
            instructions << l
          end
        end
        Fixture.new(instructions, expected_output)
      end

    end

  end
end