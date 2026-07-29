## Generic specification points

- You need a generated TOC, generated bibliography, and a cover page. Name, candidate number, centre number all on cover page. Then after the cover page do a TOC.
- For something that's quotable or e.g., AI you need to reference, insert a citation and add the source of that.
- Page numbers also good. 279 pages for all give or take.
- Flowcharts alongside pseudocode makes it even better. Looking for both of those for top top marks. For each algorithm write a paragraph on what it represents and how it slots in with other algorithms. This is under decomposition, how each algorithm slots into what you've done. At the end of algorithm section write a few paragraphs on conclusion and why each of them work for your solution. This is for describing the solution fully.
- Key variables data structures etc point - difficult to list at this point, but they really want you to plan it all now so development is quite easy so technically you do need to plan it all but obviously going to change some things as we go, but can modify this section later on or don't edit design section and just state later in the actual dev of writing code it's different e.g., due to unforeseen circumstances.
- Test data - will take time but basically as you are developing the solution what testing are you gonna do to prove its going to work before moving on. White box testing with knowledge of how solution is coded. All 4 types need a variety of data, try make it robust. More test data etc., means you can justify your solution is robust. And also black box testing plan. There will be some overlap but try and think of the first one more from a technical standpoint, second from user standpoint.
- Usability - best way is to do a quick interview with your stakeholder. Have some wireframes get feedback a bit - just to ensure user has good user experience. Also not just UI design but things like validation from a user perspective, performance, etc.

## Analysis

- Analysis section needs success criteria.
- Analysis section went up to around Pg. 42 or so, 40 pages without TOC, about right for Analysis section but depends how concise you could do in 25-30 but this is the extra mile to make sure you hit everything and is probably worth it. Sir had marked someone with 8 success criteria and they were way to generic.
- Number and sub number for category each success category is in.
- Measurability for each success criteria. She went a bit too far - 20 to 30 success criteria is fine, any more than 30 and its probably too specific, less than 15 you haven't done enough, but she did just about 6 pages.

## Design

- Decompose program first - Flowchart. Structure of it. Then decompose solution (prose). Explanation of plan for application, justification for decomposition. Then decomposition of the solution with flowchart. Well systems structure diagram into possible subroutines (1.3). Then further info about diagram and justification. Then explanation of each module that has been identified (2nd point from specification top). In a table looks nice.
- Then 2. design objectives. Not needed but just breaking down each proposed module into input / process / output but probably better not right now and better when describing the solution.
- Then 3. nature of solution. 3.1 is menu flow diagram. Talking about various menus you can use. Then big process flow diagram. Then 3.3 usability features. Created wireframes don't have to be that good but should also be labelled. And table with usability feature, in/out, and explanation / justification. Need to have good justifications so need to be not short. Justify some way as well maybe interview with stakeholder etc. Could also look at design principles. She used keynote wireframes but yeah.
- Then 4 algorithms, 4.1.1 init database, 4.2 authentication. Most interested in complexity stuff. Keep as relevant to solution. Flowcharts and a little bit of testing for each test plan - a little for each. Pseudocode for stuff that's too hard to use a flowchart for. One thing lacking is justifying how the PowerPoint was formatted for each solution. 5 have ERD - Entity Relationship Diagrams, done variables, tables, explanaton, justification, data type, etc.,. Classes as well if OOP so maybe UML diagrams. 6. was test strategry. Test each module justify it.
- As part of post-dev test plan you should be writing tests for functions and robustness so ensure robustness is still a large part of your development. She had more user-based tests to test for function and robustness. More from a user perspective than other. She has also used acceptance test plan, it's more and more common and its something thats given to the stakeholder and checks if it has met the objectives, more justification come the testing phase but not needed - optional but yes is great.

## Design Phase Specific to hmon notes

- Have a database schema with the examples of devices that can be stored and their respective data, and the
- GUI wireframe. And how the schema is updated after the user interaction with the GUI changes.
- List the algorithms for blacklisting / whitelisting the devices to the design phase, and on what basis they are done. Clearly listing
- Whole structure - each characteristic of each keyboard. How it is identifying which keyboard is what and which keyboard is giving which input.
- Add a full I think it was decomposition diagram at the start of the section for design.
- Testing data - factors on which you are deciding whether devices should be blacklisted or whitelisted. New device or seen before - added to whitelist / blacklist or not.
- Show how the project is not a research project and actual a program - ma'am is still kinda thinking it is more of a research project and not an actual NEA.
