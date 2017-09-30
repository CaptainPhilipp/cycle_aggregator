# gives access to records by primary keys
class IndexedCollection
  attr_reader :records, :pk

  def initialize(records, pk: :id)
    raise ArgumentError if records.nil? || records.empty?
    @records = records
    @pk = pk
  end

  def by_pks(pks)
    pks.map { |pk| by_pk(pk) }.compact
  end

  def by_pk(pk)
    indexed_records[pk]
  end

  private

  def indexed_records
    @indexed_records ||= index_records
  end

  def index_records
    hash = {}
    records.each { |record| hash[pk_of record] = record }
    hash
  end

  def pk_of(record)
    record.send pk
  end
end