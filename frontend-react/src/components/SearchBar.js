import React, { useState } from 'react';

const SearchBar = ({ onSearch }) => {
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedFilter, setSelectedFilter] = useState('id');

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
          <option value="id">ID</option>
          <option value="name">Name</option>
          <option value="username">Username</option>
        </select>
        <button onClick={handleSearch} className="search-button">
          Search
        </button>
      </div>
    </div>
  );
};

export default SearchBar;