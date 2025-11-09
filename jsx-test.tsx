import React, { Suspense } from 'react';

// Test JSX component with various attributes
const TestComponent = () => {
  return (
    <div className="container">
      <Suspense fallback={<div>Loading...</div>}>
        <MyComponent 
          type="submit"
          fallback={null}
          index={0}
          path="/home/user"
          title="Hello World"
          isActive={true}
          onClick={() => console.log('clicked')}
          style={{ color: 'red' }}
        />
      </Suspense>
      <button type="button" disabled={false}>
        Click me
      </button>
      <input type="text" />
      <Route path="/users" />
    </div>
  );
};

export default TestComponent;