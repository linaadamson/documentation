import React, { useState } from "react";

const FetchButton = () => {
  const [fetchResult, setFetchResult] = useState(null);

  const fetchData = async () => {
    try {
      const response = await fetch(
        "https://jsonplaceholder.typicode.com/todos/1"
      );
      const data = await response.json();
      setFetchResult(JSON.stringify(data, null, 2));
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  };

  return (
    <div>
      {!fetchResult && <button onClick={fetchData}>Fetch Data</button>}
      {fetchResult && (
        <pre>
          <code>
            {fetchResult}
          </code>
        </pre>
      )}
    </div>
  );
};

export default FetchButton;
