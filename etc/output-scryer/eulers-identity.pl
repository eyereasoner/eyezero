:- op(1200, xfx, :+).

answer(('urn:example:exponentiation'([[2.718281828459045,0],[0,pi]],[-1.0,1.2246467991473532e-16]),'urn:example:sum'([[-1.0,1.2246467991473532e-16],[1,0]],[0.0,1.2246467991473532e-16]))).

% proof steps
step((true:+'urn:example:exponentiation'([[2.718281828459045,0],[0,pi]],A),'urn:example:sum'([A,[1,0]],B)),('urn:example:exponentiation'([[2.718281828459045,0],[0,pi]],[-1.0,1.2246467991473532e-16]),'urn:example:sum'([[-1.0,1.2246467991473532e-16],[1,0]],[0.0,1.2246467991473532e-16])),true).