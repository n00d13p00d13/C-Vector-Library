1. Overview

    - The vector library provides a generic dynamic array for C, supporting:
    - Automatic resizing
    - Random access
    - Insertion and removal at any index
    - Push/pop operations at the back (and optionally at the front)
    - Safe memory management and runtime type safety
    - It can store any type of element (stack values or pointers).

2. Element Size and Type Safety

    - Element size (element_size) is specified 
      at vector creation (sizeof(type)).
    - All insertions, removals, and copies must match this size, 
      otherwise the function fails.
    - This enforces runtime type consistency.

3. Invariants

    - size ≤ capacity at all times
    - Memory is always contiguous
    - Insertions and removals do not reorder data
    - Functions that return pointers return NULL on failure
    - Operations never leave the vector partially updated
    - Capacity is never 0; if uninitialized or freed, vector pointer is NULL

4. Ownership Rules

    - The vector owns its internal array.
    - For stack values, vector stores copies internally.
    - For pointer elements, the vector stores the pointer only; 
      user manages pointed-to memory.

5. Growth Strategy

    - Initial capacity: default 64 elements
    - Upsize: multiply capacity by 1.5 when size ≥ capacity
    - Downsize: optional, but never below initial capacity
    - All internal memory allocations are calculated as: 
      capacity × element_size
    - User cannot manually resize elements 
      (except via optional reserve or shrink_to_fit)

6. Error Handling

    Functions that can fail either return:
     - Pointer (NULL on failure)
     - Success/failure code (enum)
     - Vector always remains in a valid state after failure.
    Attempting to insert a mismatched element size results in an error.

7. Convenience Functions

    - vector_push_front / vector_pop_front
        modify the front of the array, shifting elements
    - vector_copy 
        duplicate entire vector
    - vector_swap 
        swap two elements by index
    - vector_find 
        locate an element using a comparator function
    - vector_clone_element 
        copy a single element using a user-provided copy callback

