# LeGaLCore


### Implementation of NCL Extensions

LeGaL is a declarative language. It is based on the NCL entity concept and has an XML representation. It also inherits the NCL flexibility for temporal synchronism definition. The layout of LeGaL components resembles an NCL document structure. A LeGaL document can be translated into a directed nested graph, where nodes and edges are used to describe LBGs concepts presented in Section~\ref{subsec:game-model}. As we stated, LeGaL is designed for the extension of NCL documents enabling them to model LBGs. In fact, it describes the structure of these games. Thus, the resulting graph of this model represents missions that players must accomplish in an LBG. The graph also includes the composition of missions (media with which the player interacts) and the relationships between the missions and media files. It introduces the game flow, from its inception to its accomplishment. LeGaL graphs use two types of nodes: \textbf{context nodes} (composite nodes), and \textbf {media nodes}. The former represents nesting of nodes in the graph and the latter describes the associated media files. The edges of the graph represent the relationships between the nodes, i.e., the game flow. In LeGaL, ordering and time synchronisation between nodes are defined by the connectors and links.

LeGaL inherits several key NCL and NCM 3.0~\cite{soares2005nested} concepts such as nodes, links, and connectors. For the in-depth understanding of these definitions, the complete NCL documentation can be accessed at NCL Website (http://www.ncl.org.br/en).

There are some new attributes and extensions done to NCL in order to support the modelling of LBGs. This document shows some of these new features.

### Configurable Props
* [occurrence](#occurrence)
* [visibility](#visibility)
* [mandatory](#mandatory)

### Events

### Mission Properties

We add some properties to the context node for representing mission information. For instance, the number of times a mission can be played, which missions are required to be played before playing the others, and others. In example below, we show the use of these properties for the running example description. The occurrence property defines the msSecondChurch mission can be played as many times as the player wants, the mandatory property says the mission is mandatory to finish the game and the visibility sets the mission is always visible to the player. Table contains four of these properties and its possible values.

Property | Values | Description
--- | --- | ---
mandatory | true or false | Defines whether a mission is mandatory.
occurrence | Positive integer | Sets how many times the mission can be executed.
visibility | true or false | Indicates if a mission can be executed.
requirements | List of values | Stores a list of required missions.

``` xml
<context id="msSecondChurch">
  <port id="pSecondChurch" component="locSecondChurch"/>
  <property name="mandatory" value="true"/>
  <property name="occurrence" value="unbounded"/>
  <property name="visibility" value="true"/>

  <media id="locSecondChurch" type="application/gml+xml" src="media/secondChurch.gml"/>
  <media id="mdVideo" type="video/3gpp" src="media/thirdChurchIndicator.3gp"/>
</context>
```
