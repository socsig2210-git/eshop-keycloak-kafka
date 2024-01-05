import React, { useState } from 'react';

const SearchBar = ({ onSearch }) => {
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedFilter, setSelectedFilter] = useState('title');

  const handleInputChange = (event) => setSearchTerm(event.target.value);
  const handleFilterChange = (event) => setSelectedFilter(event.target.value);

  const handleSearch = () => {
    // Pass the search term and selected filter to the parent component
    onSearch(searchTerm, selectedFilter);
  };

  return (
    <div className="search-bar-container">
      <div className="search-bar">
        <input
          type="text"
          placeholder="Search..."
          value={searchTerm}
          onChange={handleInputChange}
          className="search-input"
        />
        <select value={selectedFilter} onChange={handleFilterChange} className="filter-dropdown">
          <option value="title">Title</option>
          <option value="id">Id</option>
          <option value="seller">Seller</option>
        </select>
        <button onClick={handleSearch} className="search-button">
          Search
        </button>
      </div>
    </div>
  );
};

export default SearchBar;