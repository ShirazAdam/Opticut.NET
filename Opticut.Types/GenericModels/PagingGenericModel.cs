namespace Opticut.Types.GenericModels
{
    public record PagingGenericModel
    {
        public int PageNumber { get; set; }

        public int RowsPerPage { get; set; }

        public int TotalRows { get; set; }

        public int PageNumberForDatabase => PageNumber - 1;
    }
}
